class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]

  # GET /summaries
  # GET /summaries.json
  def index
    @summaries = Summary.all
  end
end
