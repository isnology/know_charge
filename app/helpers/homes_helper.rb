module HomesHelper
  
  def booked_name(meetings)
    list = Hash.new('')
    meetings.each { |meeting|  list.store(meeting.name, meeting.name) if meeting.name  }
    "#{list['am']}#{list['pm']}"
  end
  
  def google_keys()
    if Rails.env.production?
      "key=#{ENV.fetch('MAPS_KEYJS')}&"
    else
      ''
    end
  end
end
