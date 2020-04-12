module RailsBancoPatagonia
  module Sueldos
    class SueldosLoteDetalle < Fixy::Record
      include Fixy::Formatter::Alphanumeric
      include Fixy::Formatter::Numeric

      set_record_length 200

      # Fields Declaration:
      # -----------------------------------------------------------
      #       name          size      Range             Format
      # ------------------------------------------------------------
      field :tipo_registro, 1, '1-1', :numeric
      field :numero_lote, 4, '2-5', :numeric
      field :tipo_cuenta, 1, '6-6', :numeric
      field :numero_cuenta, 10, '7-16', :numeric
      field :importe_acreditar, 11, '17-27', :numeric
      field :numero_comprobante, 7, '28-34', :numeric
      field :apellido_nombre, 20, '35-54', :alphanumeric
      field :codigo_banco, 3, '55-57', :numeric
      field :codigo_sucursal, 5, '58-62', :numeric
      field :tipo_documento, 3, '63-65', :numeric
      field :numero_documento, 17, '66-82', :numeric
      field :provincia_documento, 2, '83-84', :numeric
      field :codigo_dependencia, 15, '85-99', :numeric
      field :espacios, 1, '100-100', :alphanumeric
      field :tipo_liquidacion, 3, '101-103', :numeric
      field :espacios2, 93, '104-196', :numeric
      field :numero_empresa, 4, '197-200', :numeric

      def initialize(item, lote_count, numero_empresa)
        @espacios = ' '
        @espacios2 = 0
        @tipo_registro = 2 # fixed value
        @numero_lote = lote_count
        @numero_empresa = numero_empresa
        @tipo_cuenta = item[:tipo_cuenta]
        @numero_cuenta = item[:numero_cuenta]
        @importe_acreditar = item[:importe_total]
        @numero_comprobante = item[:employee_id]
        @apellido_nombre = item[:name]
        @codigo_banco = item[:codigo_banco]
        @codigo_sucursal = item[:codigo_sucursal]
        @tipo_documento = item[:tipo_documento] || 001 # default DNI
        @numero_documento = item[:numero_documento]
        @provincia_documento = item[:provincia_documento] || 01 # default CABA
        @codigo_dependencia = item[:codigo_dependencia]
        @tipo_liquidacion = item[:tipo_liquidacion] || 001 # default SUELDOS
      end

      attr_reader :tipo_registro, :numero_lote, :numero_empresa, :tipo_cuenta, :numero_cuenta, :importe_acreditar,
      :numero_comprobante, :apellido_nombre, :codigo_banco, :codigo_sucursal, :tipo_documento, :numero_documento,
      :provincia_documento, :codigo_dependencia, :tipo_liquidacion, :espacios, :espacios2, :version

    end
  end
end