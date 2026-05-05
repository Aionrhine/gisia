# frozen_string_literal: true

# ======================================================
# Contains code from GitLab FOSS (MIT Licensed)
# Copyright (c) GitLab Inc.
# See .licenses/Gisia/others/gitlab-foss.dep.yml for full license
# ======================================================

module Gitlab
  module GlId
    def self.gl_id(actor)
      case actor
      when User
        "user-#{actor.id}"
      when DeployToken
        "deploy-token-#{actor.id}"
      else
        ''
      end
    end
  end
end
