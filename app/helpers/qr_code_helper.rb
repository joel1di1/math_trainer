# frozen_string_literal: true

module QrCodeHelper
  def qr_code_svg(text, size: 200)
    qrcode = RQRCode::QRCode.new(text)
    qrcode.as_svg(
      module_size: 4,
      standalone: true,
      use_path: true,
      viewbox: true,
      svg_attributes: {
        class: 'qr-code',
        width: size,
        height: size
      }
    ).html_safe
  end
end
