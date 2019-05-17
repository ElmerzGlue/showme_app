class StaticController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def rules
  end

  def get_rules
    params[:page_title] = 'Competition Rules'
    send_file"#{Rails.root}/public/files/rules.pdf", filename: 'ShowMeCompRules.pdf', type: :pdf,
             disposition: :inline
  end

  def get_rules_evidence
    send_file"#{Rails.root}/public/files/rules_of_evidence.pdf", filename: 'ShowMeRulesEvidence.pdf',
              type: :pdf, disposition: :inline
  end

  def rule_highlights
  end
  
end
