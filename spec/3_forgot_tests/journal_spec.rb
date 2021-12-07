# frozen_string_literal: true

require "spec_helper"
require_relative "../../lib/3_forgot_tests/journal"

RSpec.describe Journal do
  subject(:journal) { described_class }

  let(:debit1) { Journal::Line.new(10.0) }
  let(:debit2) { Journal::Line.new(6.0) }
  let(:credit1) { Journal::Line.new(8.0, debit: false) }
  let(:credit2) { Journal::Line.new(5.0, debit: false) }

  describe "#total" do
    context "with only debit lines" do
      let(:instance) { journal.new(debit1, debit2) }

      it "returns the correct sum" do
        expect(instance.total).to eq 16.0
      end
    end

    context "with only credit lines" do
      let(:instance) { journal.new(credit1, credit2) }

      it "returns the correct sum" do
        expect(instance.total).to eq(-13.0)
      end
    end

    context "with debit and credit lines" do
      let(:instance) { journal.new(debit1, debit2, credit1, credit2) }

      it "returns the correct sum" do
        expect(instance.total).to eq 3.0
      end
    end
  end
end
