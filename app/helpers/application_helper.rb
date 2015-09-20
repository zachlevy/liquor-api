module ApplicationHelper
  # helper function
  def self.merge_group_stats sales, shipments
    keys = [sales, shipments].flat_map(&:keys).uniq
    keys.map do |k|
      {
        date: k,
        sales: sales[k] || 0,
        shipments: shipments[k] || 0
      }
    end.reverse
  end
end
