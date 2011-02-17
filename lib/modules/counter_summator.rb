# -*- coding: utf-8 -*-
module CounterSummator

  def counter_name
    name.underscore.sub(/_.*/,'').pluralize + '_count'
  end
  
  def summarize_counters truncated_time, seconds, summarized_at
    where = summarized_at.blank? ?
    [ "created_at<=?", truncated_time ] :
      [ "created_at>? and created_at<=?", summarized_at, truncated_time ]
    
    sql_round_time = "timestamp with time zone 'epoch' + trunc(extract(epoch from now())/#{seconds}) * #{seconds} * INTERVAL '1 second'"
    group_by = "place_id, campaign_id, banner_id, date(created_at), #{sql_round_time}"

    total_counter = 0
    
    select("#{group_by} as time, count(*)").
      where(where).group(group_by).each do |stats|
      
      count = stats.attributes["count"].to_i
      attrs = stats.attributes.except "count"
      
      if record = Stat.where(attrs).first
        record.increment! counter_name, count
      else
        attrs[counter_name] = count
        Stat.create(attrs)
      end

      total_counter +=count
    end
    total_counter
  end

end
