require_relative './lib/register_talk'

conference = RegisterTalk.new
conference.register_talk_sessions
conference.print_schedule