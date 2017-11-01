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
      when 'favourites'
        'My Favourites'
      else
        ''
    end
  end
  
end
