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

  def location
  end

  def deadlines
  end

  def get_case
    params[:page_title] = '2019 Case'
    send_file "#{Rails.root}/public/files/case 9-15.pdf", filename: 'Show Me Mock Trial 2019 Case 9-15-2019.pdf', type: :pdf,
    disposition: :inline
  end

  def get_rules
    params[:page_title] = 'Competition Rules'
    send_file"#{Rails.root}/public/files/rules 9-16.pdf", filename: 'ShowMeCompRules.pdf', type: :pdf,
    disposition: :inline
  end

  def get_rules_evidence
    send_file"#{Rails.root}/public/files/rules_of_evidence.pdf", filename: 'ShowMeRulesEvidence.pdf',
              type: :pdf, disposition: :inline
  end

  def get_ballot
    send_file "#{Rails.root}/public/files/ballot.pdf", filename: "Show Me Mock Trial Ballot.pdf", type: :pdf, disposition: :inline
  end

  def get_guidelines
    send_file "#{Rails.root}/public/files/Show Me Mock Trial Invitational Guidelines and Comments.pdf", type: :pdf, disposition: :inline
  end

  def rule_highlights
  end
  
end
