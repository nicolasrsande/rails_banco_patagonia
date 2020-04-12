require "rails_banco_patagonia/version"
require 'rails_banco_patagonia/fixy/formatters/numeric'
require 'rails_banco_patagonia/sueldos/sueldos'
require 'rails_banco_patagonia/sueldos/records/sueldos_header'
require 'rails_banco_patagonia/sueldos/records/sueldos_lote_header'
require 'rails_banco_patagonia/sueldos/records/sueldos_lote_detalle'

module RailsBancoPatagonia
  class Error < StandardError; end

end
