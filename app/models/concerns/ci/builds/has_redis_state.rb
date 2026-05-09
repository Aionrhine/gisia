# frozen_string_literal: true

# ======================================================
# Contains code from GitLab FOSS (MIT Licensed)
# Copyright (c) GitLab Inc.
# See .licenses/Gisia/others/gitlab-foss.dep.yml for full license
#
# Modifications and additions copyright (c) 2025-present Liuming Tan
# Licensed under AGPLv3 - see LICENSE file in this repository
# ======================================================

module Ci
  module Builds
    module HasRedisState
      extend ActiveSupport::Concern
      include Gitlab::Utils::StrongMemoize

      included do
        after_save { redis_state.save if defined?(@redis_state) }
      end

      def enqueue_immediately?
        redis_state.enqueue_immediately?
      end

      def set_enqueue_immediately!
        redis_state.enqueue_immediately = true
      end

      def redis_state
        strong_memoize(:redis_state) do
          Ci::JobRedisState.find_or_initialize_by(job: self)
        end
      end
    end
  end
end
