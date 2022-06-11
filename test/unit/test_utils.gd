extends GutTest

#Convertir número a string
func test_convertir_numero_a_texto_devuelve_el_numero_en_string():
	var valor_convertido = Utils.convertir_number_a_string(15)
	assert_true(valor_convertido == "15")
	pass
	
func test_convertir_numero_a_texto_devuelve_un_string_vacio():
	var valor_convertido = Utils.convertir_number_a_string("")
	assert_true(valor_convertido == "")
	pass



#
func test_formatear_numero_mayor_a_10_devuelve_el_mismo_numero_como_string():
	var valor_formateado = Utils.formatear_timer(15)
	assert_true(valor_formateado == "15")
	pass
	
func test_formatear_numero_menor_a_10_devuelve_el_mismo_numero_como_string_completando_con_0_a_la_izquierda():
	var valor_formateado = Utils.formatear_timer(5)
	assert_true(valor_formateado == "05")
	pass
	
func test_formatear_numero_mayor_a_99_devuelve_el_mismo_numero_como_string():
	var valor_formateado = Utils.formatear_timer(100)
	assert_true(valor_formateado == "100")
	pass
	
	
#
func test_validar_atributo_fuerza_mayor_a_NArma_es_valido():
	var fuerza_mayor_a_NArma = Utils.validar_atributo(10, 3)
	assert_true(fuerza_mayor_a_NArma == true)
	pass

func test_validar_atributo_fuerza_igual_a_NArma_es_valido():
	var fuerza_igual_a_NArma = Utils.validar_atributo(10, 5)
	assert_true(fuerza_igual_a_NArma == true)
	pass
	
func test_validar_atributo_fuerza_menor_a_NArma_no_es_valido():
	var fuerza_menor_a_NArma = Utils.validar_atributo(10, 6)
	assert_true(fuerza_menor_a_NArma == false)
	pass
	
	
	
