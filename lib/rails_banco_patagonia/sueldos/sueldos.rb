module RailsBancoPatagonia
  module Sueldos

    ## Payment Class Format
    # settlement = { numero_envio: num,
    #                numero_empresa: num,
    #                importe_total: num,
    #                tipo_acreditacion: num,
    #                fecha_acreditacion: AAAAMMDD
    #                employee_settlements: [ {
    #                                        employee_id: num
    #                                        name: text,
    #                                        codigo_documento: num,
    #                                        numero_documento: num,
    #                                        provincia_documento: num,
    #                                        codigo_dependencia: num,
    #                                        tipo_liquidacion: num,
    #                                        tipo_cuenta: num,
    #                                        codigo_banco: num,
    #                                        codigo_sucursal: num,
    #                                        numero_cuenta: num,
    #                                        importe_total: num } ] }
    #
    class Payment < Fixy::Document

      def initialize(settlement)
        @settlement = settlement
        @lotes = @settlement[:employee_settlements]
        @numero_envio = @settlement[:numero_envio] || 1
        @numero_empresa = @settlement[:numero_empresa]
        @fecha_presetancion = Date.now.strftime('%Y%m%d')
        @fecha_acreditacion = @settlement[:fecha_acreditacion] || Date.now.strftime('%Y%m%d')
        @importe_total = @settlement[:importe_total]
        @tipo_acreditacion = @settlement[:tipo_acreditacion] || 0
        @lote_count = 0
      end

      def build
        @lotes.each do |lote|
          numero_lote
          append_record SueldosLoteDetalle.new(lote,
                                               @lote_count,
                                               @numero_empresa)
          append_record SueldosLoteHeader.new(lote,
                                              @lote_count,
                                              @numero_empresa,
                                              @numero_envio)
        end
          prepend_record SueldosHeader.new(@numero_empresa,
                                           @numero_envio,
                                           @lote_count,
                                           @importe_total,
                                           @tipo_acreditacion,
                                           @fecha_presetancion)
      end

      private

      def numero_lote
        @lote_count += 1
      end

    end
  end
end