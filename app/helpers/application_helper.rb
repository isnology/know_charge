module ApplicationHelper
  
  def set_target(action)
    action == controller_name ? 'target' : ''
  end
  
  def set_heading
    case controller_name
      when 'homes'
        'Home'
      when 'profiles'
        'My Details'
      when 'vehicles'
        'My Vehicles'
      when 'charge_stations'
        'My Charge Stations'
      when 'bookings'
        'My Bookings'
      when 'favourites'
        'My Favourites'
      when 'adapter_plugs'
        'Adapter Plugs'
      when 'adapters'
        'Adapters'
      else
        ''
    end
  end
  
  def to_days(week)
    days = %w(Su Mo Tu We Th Fr Sa)
    week.split('').map { |day| days[day.to_i] }.join(' ')
  end
  
end
