# frozen_string_literal: true

# ======================================================
# Contains code from GitLab FOSS (MIT Licensed)
# Copyright (c) GitLab Inc.
# See .licenses/Gisia/others/gitlab-foss.dep.yml for full license
#
# Modifications and additions copyright (c) 2025-present Liuming Tan
# Licensed under AGPLv3 - see LICENSE file in this repository
# ======================================================

module Commits
  module Signaturable
    extend ActiveSupport::Concern

    def has_signature?
      signature_type && signature_type != :NONE
    end

    def raw_signature_type
      strong_memoize(:raw_signature_type) do
        next unless @raw.instance_of?(Gitlab::Git::Commit)

        if defined? @raw.raw_commit.signature_type
          @raw.raw_commit.signature_type
        end
      end
    end

    def signature_type
      @signature_type ||= raw_signature_type || :NONE
    end

    def signature
      strong_memoize(:signature) do
        case signature_type
        when :PGP
          gpg_commit.signature
        when :X509
          Gitlab::X509::Commit.new(self).signature
        when :SSH
          Gitlab::Ssh::Commit.new(self).signature
        end
      end
    end

    def gpg_commit
      @gpg_commit ||= Gitlab::Gpg::Commit.new(self)
    end
  end
end
