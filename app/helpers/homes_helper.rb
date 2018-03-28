module HomesHelper
  
  def booked_name(meetings)
    list = Hash.new('')
    meetings.each { |meeting|  list.store(meeting.name, meeting.name) if meeting.name  }
    "#{list['am']}#{list['pm']}"
  end
  
  def google_keys()
    "key=#{ENV.fetch('MAPS_KEYJS')}&"
  end
end
