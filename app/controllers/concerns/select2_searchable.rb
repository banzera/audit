module Select2Searchable extend ActiveSupport::Concern

  included do
  end

  def search_params
    return nil if params[:search].blank? || params.require(:search).is_a?(String)

    params.require(:search).permit([
      :term, :q,
      :_type,
      :page
    ])
  end

  def select2_search_term?
    select2_search_term.present?
  end

  def select2_search_term
    return nil unless search_params.present?

    (search_params[:term] || search_params[:q] || '').downcase.gsub(' ','%')
  end

end
