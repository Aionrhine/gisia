# frozen_string_literal: true

# ======================================================
# Contains code from GitLab FOSS (MIT Licensed)
# Copyright (c) GitLab Inc.
# See .licenses/Gisia/others/gitlab-foss.dep.yml for full license
# ======================================================

# Holds reasons for a notification to have been sent as well as a priority list to select which reason to use
# above the rest
class NotificationReason
  OWN_ACTIVITY = 'own_activity'
  ASSIGNED = 'assigned'
  REVIEW_REQUESTED = 'review_requested'
  MENTIONED = 'mentioned'
  SUBSCRIBED = 'subscribed'

  # Priority list for selecting which reason to return in the notification
  REASON_PRIORITY = [
    OWN_ACTIVITY,
    ASSIGNED,
    REVIEW_REQUESTED,
    MENTIONED,
    SUBSCRIBED
  ].freeze

  # returns the priority of a reason as an integer
  def self.priority(reason)
    REASON_PRIORITY.index(reason) || (REASON_PRIORITY.length + 1)
  end
end
