class StatsCollector < LoopDance::Dancer

  every 15.minutes do
    Stat.summarize_all
  end

  every 30.minutes do
    Campaign.expired &:archive
    Campaign.ready_to_start &:activate
  end

end
