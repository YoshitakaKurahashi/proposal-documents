require 'rails_helper'

RSpec.describe Proposal, type: :model do
  before do
    @proposal = FactoryBot.build(:proposal)
  end

  describe 'proposalの保存' do
    context "proposalが保存できる場合" do

      it "空欄が無ければproposalは保存される" do
        expect(@proposal).to be_valid
      end

      it "タイトルが20文字以内であればproposalは保存される" do
        @proposal.title = '大型巨人の活用方法についての企画書'
        expect(@proposal).to be_valid
      end

      it "内容が250文字以内であればproposalは保存される" do
        @proposal.detail = '大型巨人の活用方法についての企画書です。今までは憎むべき敵だった巨人を今度は活用し戦闘に活用する。'
        expect(@proposal).to be_valid
      end
      it "予算が数値であればproposalは保存される" do
        @proposal.budget = '20000'
        expect(@proposal).to be_valid
      end

    end

    context "proposalが保存できない場合" do

      it "テキストがないとproposalは保存できない" do
        @proposal.title = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Title can't be blank")
      end

      it "テキストが20文字を超えるとproposalは保存できない" do
        @proposal.title = @proposal.title + 'ありがとう！'
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Title is too long (maximum is 20 characters)")
      end

      it "内容がないとproposalは保存できない" do
        @proposal.detail = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Detail can't be blank")
      end

      it "内容が250文字を超えるとproposalは保存できない" do
        @proposal.detail = @proposal.detail + 'ありがとうね！'
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Detail is too long (maximum is 250 characters)")
      end

      it "期間（開始）がないと保存できない" do
        @proposal.term_start = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Term start can't be blank")
      end

      it "期間（終了）がないと保存できない" do
        @proposal.term_end = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Term end can't be blank")
      end

      it "対象者がないと保存できない" do
        @proposal.target_group = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Target group can't be blank")
      end

      it "目標がないと保存できない" do
        @proposal.numeric = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Numeric can't be blank")
      end

      it "予算がないと保存できない" do
        @proposal.budget = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Budget can't be blank")
      end

      it "予算が数値でないと保存できない" do
        @proposal.budget = 'もりもり'
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Budget is not a number")
      end

      it "支払い方法がないと保存できない" do
        @proposal.payment = ''
        @proposal.valid?
        expect(@proposal.errors.full_messages).to include("Payment can't be blank")
      end

    end
  end
end
