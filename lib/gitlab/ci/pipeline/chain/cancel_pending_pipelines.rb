# frozen_string_literal: true

# ======================================================
# Contains code from GitLab FOSS (MIT Licensed)
# Copyright (c) GitLab Inc.
# See .licenses/Gisia/others/gitlab-foss.dep.yml for full license
# ======================================================

module Gitlab
  module Ci
    module Pipeline
      module Chain
        class CancelPendingPipelines < Chain::Base
          def perform!
            cancellation_worker_class.perform_async(pipeline.id, { 'partition_id' => pipeline.partition_id })
          end

          def break?
            false
          end

          private

          def cancellation_worker_class
            if pipeline.schedule?
              ::Ci::LowUrgencyCancelRedundantPipelinesWorker
            else
              ::Ci::CancelRedundantPipelinesWorker
            end
          end
        end
      end
    end
  end
end
