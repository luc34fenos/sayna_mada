require "render_anywhere"
 
class CvPdf
  include RenderAnywhere
 
  def initialize(cv)
    @cv = cv
  end
 
  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/moncv.pdf")
  end
 
  def filename
    "moncv #{cv.id}.pdf"
  end
 
  private
 
    attr_accessor :cv
 
    def as_html
      render template: "cvs/pdf", layout: "cv_pdf", locals: { cv: cv }
    end
end