class PdfGeneratorController < ApplicationController
  def index
    if [:currency, :from_date, :to_date].all? {|r| params.has_key? r}
      @code = (Currency.find_by(name: params[:currency])).code
      @pdf_to_generate = PdfGeneratorService.call(@code, params[:from_date], params[:to_date])
      @name = @pdf_to_generate['currency']
      @values = @pdf_to_generate['rates']

      pdf = WickedPdf.new.pdf_from_string(render_to_string('pdf_generator/_pdf.html.erb', layout: false))
      send_data pdf, filename: "#{@code} #{params[:from_date]}_#{params[:to_date]}"
    end
  end
end
