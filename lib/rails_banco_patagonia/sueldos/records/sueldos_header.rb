module RailsBancoPatagonia
  module Sueldos

    class SueldosHeader < Fixy::Record
      include Fixy::Formatter::Alphanumeric
      include Fixy::Formatter::Numeric

      set_record_length 200

      # Fields Declaration:
      # -----------------------------------------------------------
      #       name          size      Range             Format
      # ------------------------------------------------------------
      field :tipo_registro, 1, '1-1', :numeric
      field :codigo_banco, 3, '2-4', :numeric
      field :espacios, 5, '5-9', :alphanumeric
      field :numero_empresa, 4, '10-13', :numeric
      field :fecha_presentacion, 8, '14-21', :numeric
      field :numero_envio, 2, '22-23', :numeric
      field :cantidad_lotes, 4, '24-27', :numeric
      field :espacios2, 2, '28-29', :alphanumeric
      field :importe_lotes, 15, '30-44', :numeric
      field :espacios3, 10, '45-54', :alphanumeric
      field :tipo_acreditacion, 1, '55-55', :numeric
      field :espacios4, 133, '56-188', :alphanumeric
      field :version, 8, '189-196', :alphanumeric
      field :numero_empresa2, 4, '197-200', :numeric

      # Field Definition
      def initialize(numero_empresa, numero_envio, lote_count, importe_total, tipo_acreditacion, fecha_presentacion)
        @espacios = @espacios2 = @espacios3 = @espacios4 = @version = ' '
        @tipo_registro = 0
        @codigo_banco = 034
        @numero_empresa = @numero_empresa2 = numero_empresa
        @fecha_presentacion = fecha_presentacion
        @numero_envio = numero_envio
        @cantidad_lotes = lote_count
        @importe_lotes = importe_total
        @tipo_acreditacion = tipo_acreditacion
      end

      attr_reader :tipo_registro, :codigo_banco, :numero_empresa, :numero_empresa2, :fecha_presentacion,
      :numero_envio, :cantidad_lotes, :importe_lotes, :tipo_acreditacion, :espacios, :espacios2, :espacios3, :espacios4,
      :version

    end
  end
end