; ------------------------------------------------------------
; Registrar un abogado dentro de un consorcio en vConsorio		
; ------------------------------------------------------------
(defun registrarAbogado ()
	(print "------------------------------------------------------")
    (print "REGISTRO DE ABOGADO")
	(print "------------------------------------------------------")
	
	(setq nitConsorcio nil)
	(loop
		(print "Digite el valor numerico del nit al que se va a agregar el abogado")
		(setq nitConsorcio (read))
			(if (numberp nitConsorcio)
				(return nitConsorcio)
				(print "El valor del nit no es numerico")
			)
	)
	;Buscar el la posicion dentro de vConsorcio que sea igual a nitConsorcio 
	(setq posConsorcio nil)
	(dotimes (i 2)
		(let ((cons (aref vConsorcio i)))
			(when (and cons                              ; la posición no es NIL
					(consorcioAbogados-nit cons)      
					(= nitConsorcio (consorcioAbogados-nit cons)))
			(setq posConsorcio i)
			(return)
			)
		)
	)
	;No se encuentra el consorcio con ese nit
	(when (null posConsorcio)
		(print "El valor del nit de consorcio no existe")
		(return-from registrarAbogado nil)
	)
	;Guardamos el valor del consorcio encontrado
	(setq consorcioEncontrado (aref vConsorcio posConsorcio))
	
	;Buscamos la posicion ahora del arreglo de abogados para esa posicion de consorcio
	 (setq posAbogado nil)
	 (dotimes (j 2)
		(let ((abg (aref (consorcioAbogados-abogados consorcioEncontrado) j)))
			(when (or (null abg) ; posición vacía
				(null (abogado-tarjeta abg)))
				(setq posAbogado j)
				(return)
			)
		)
	 )
	(when (null posAbogado)
		(print "No es posible registrar mas abogados en este consorcio")
		(return-from registrarAbogado nil)
	)
	
	
	;Ahora pedimos los datos del abogado
	(loop
		(print "Digite el valor de la tarjeta profesional")
		(setq tarjeta (read))
		(if (numberp tarjeta)
			(return tarjeta)
			(print "El valor de la tarjeta debe ser numerico")
		)
	)
	
	(print "Digite el nombre del abogado")
	(setq nombreAbogado (read))
	
	(setq tipo "")
	(loop
		(print "Digite el tipo FAMILIAR , LABORAL o PENAL (Con comillas dobles \"\)")
		(setq tipo (read))
		(if (or (equal tipo "FAMILIAR") 
				(equal tipo "LABORAL") 
				(equal tipo "PENAL"))
			(return tipo)
			(print "Tipo invalido. Intente de nuevo.")
		)
	)
	
	;Registramos el abogado	
	(setf (aref (consorcioAbogados-abogados consorcioEncontrado) posAbogado)
		(make-abogado
			:tarjeta tarjeta
			:nombre nombreAbogado
			:tipo tipo
		)
	)
	
  (print "------------------------------------------------------")
  (format t "~%Abogado registrado correctamente en la posicion ~a del consorcio ~a." 
          posAbogado 
          (consorcioAbogados-nombre consorcioEncontrado))
  (print "------------------------------------------------------")
)

