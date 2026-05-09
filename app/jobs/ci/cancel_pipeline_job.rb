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
  class CancelPipelineJob < ApplicationJob
    queue_as :default

    def perform(pipeline_id, auto_canceled_by_pipeline_id)
      ::Ci::Pipeline.find_by_id(pipeline_id).try do |pipeline|
        ::Ci::CancelPipelineService.new(
          pipeline: pipeline,
          current_user: nil,
          cascade_to_children: false,
          auto_canceled_by_pipeline: ::Ci::Pipeline.find_by_id(auto_canceled_by_pipeline_id)
        ).force_execute
      end
    end
  end
end
