class StatsCollector < LoopDance::Dancer

  # collect stats every 15 minutes
  every 15.minutes do
    # TODO: add stats collection
  end

  every 30.minutes do
    Campaign.expired &:archive
    Campaign.ready_to_start &:activate
  end

end
