class DownloadsController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_cv_pdf }
 
      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end
 
  private
 
  def cv
    Cv.find(params[:cv_id])
  end
 
  def cv_pdf
    CvPdf.new(cv)
  end
 
  def send_cv_pdf
    send_file cv_pdf.to_pdf,
    filename: cv_pdf.filename,
    type: "application/pdf",
    disposition: "inline"
  end
 
  def render_sample_html
    render template: "cvs/pdf", student: @student, layout: "cv_pdf", locals: { cv: cv }
  end
end
