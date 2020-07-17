class LogPrinter
  def print_visits(parsed_logs)
    logs_sorted_by_visits(parsed_logs).map { |endpoint, visits| puts "#{endpoint} #{visits.count} visits" }
  end

  def print_unique_views(parsed_logs)
    logs_sorted_by_unique_views(parsed_logs).map { |endpoint, views| puts "#{endpoint} #{views.uniq.count} unique views" }
  end

  def print_logs(parsed_logs)
    @parsed_logs = parsed_logs
    print_visits(parsed_logs)
    puts
    print_unique_views(parsed_logs)
  end

  private

  attr_reader :parsed_logs

  def logs_sorted_by_visits(parsed_logs)
    parsed_logs.sort_by { |_endpoint, visits| visits.count }.reverse
  end

  def logs_sorted_by_unique_views(parsed_logs)
    parsed_logs.sort_by { |_endpoint, visits| visits.uniq.count }.reverse
  end
end
