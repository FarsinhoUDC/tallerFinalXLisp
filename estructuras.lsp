;----------------------------------------------------
;Definiendo estrucuturas consorcio de abogados.
;modalidad solo toma los valores de PUBLICO Y PRIVADO
;-----------------------------------------------------
(defstruct consorcioAbogados
	nit
	nombre
	modalidad
	abogados
)

;-----------------------------------------------------
;Definimos la estructura para los abogados
;Tipo de abogado toma los valores de FAMILIAR, LABORAL, PENAL
;-----------------------------------------------------

(defstruct abogado
	tarjeta
	nombre
	tipo
)

;Creamos un consorcio con su vector de abogados vacio
(defun crearConsorcioVacio ()
  (make-consorcioAbogados
    :nit nil
    :nombre nil
    :modalidad nil
    :abogados (make-array 2 :initial-element nil)
  )
)

