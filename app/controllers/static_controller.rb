class StaticController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def rules
  end

  def schedule
  end

  def case
  end

  def get_case
    params[:page_title] = '2019 Case'
    send_file "#{Rails.root}/public/files/case 8-11.pdf", filename: 'Show Me Mock Trial 2019 Case 8-10-2019.pdf', type: :pdf,
    disposition: :inline
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
