# frozen_string_literal: true

# ======================================================
# Contains code from GitLab FOSS (MIT Licensed)
# Copyright (c) GitLab Inc.
# See .licenses/Gisia/others/gitlab-foss.dep.yml for full license
# ======================================================

module Repositories
  class WebBasedCommitSigningSetting
    def initialize(repository)
      @repository = repository
    end
    attr_reader :repository

    def sign_commits?
      true
    end
  end
end
Repositories::WebBasedCommitSigningSetting.prepend_mod

