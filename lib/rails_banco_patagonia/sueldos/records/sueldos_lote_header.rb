module RailsBancoPatagonia
  module Sueldos

    class SueldosLoteHeader < Fixy::Record
      include Fixy::Formatter::Alphanumeric
      include Fixy::Formatter::Numeric

      set_record_length 200

      # Fields Declaration:
      # -----------------------------------------------------------
      #       name          size      Range             Format
      # ------------------------------------------------------------
      field :tipo_registro, 1, '1-1', :numeric
      field :numero_lote, 4, '2-5', :numeric
      field :tipo_movimiento, 1, '6-6', :numeric
      field :concepto, 10, '7-16', :alphanumeric
      field :cantidad_lote, 3, '17-19', :numeric
      field :importe_lote, 15, '20-34', :numeric
      field :fecha_acreditacion, 8, '35-42', :numeric
      field :numero_envio, 2, '43-44', :numeric
      field :espacios, 144, '45-188', :alphanumeric
      field :version, 8, '189-196', :alphanumeric
      field :numero_empresa, 4, '197-200', :alphanumeric

      def initialize(item, numero_lote, numero_empresa, numero_envio)
        @tipo_registro = 1 # fixed value
        @tipo_movimiento = 2 # fixed value
        @cantidad_lote = 1 # siempre la acreditacion va a ser total
        @numero_envio = numero_envio
        @numero_empresa = numero_empresa
        @numero_lote = numero_lote
        @concepto = item[:periodo_liquidado] || 'EMEGA' # default
        @importe_lote = item[:importe_total]
        @fecha_acreditacion = item[:fecha_acreditacion]
      end

      attr_reader :tipo_movimiento, :tipo_registro, :cantidad_lote, :numero_envio, :numero_empresa, :numero_lote,
                  :concepto, :importe_lote, :fecha_acreditacion

    end
  end
end