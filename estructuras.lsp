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

;Creamos el array de consorcioAbogados
(setq vConsorcio (make-array 2))

;Creamos un consorcio con su vector de abogados vacio
(defun crearConsorcioVacio ()
  (make-consorcioAbogados
    :nit nil
    :nombre nil
    :modalidad nil
    :abogados (make-array 2)
  )
)

;Se crea con la estructura de la funcion crearConsorcioVacio
(setf (aref vConsorcio 0) (crearConsorcioVacio))
(setf (aref vConsorcio 1) (crearConsorcioVacio))
