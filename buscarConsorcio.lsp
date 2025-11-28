;; ------------------------------------------------------------
; Buscar consorcio por NIT 
; -----------------------------------------------------------

(defun buscarConsorcio ()
  (setq nitBusqueda nil)

  ;; Leer NIT
  (loop
    (print "Digite el NIT a buscar del consorcio")
    (setq nitBusqueda (read))
    (if (numberp nitBusqueda)
        (return nitBusqueda)
        (print "El valor del nit no es numerico")
    )
  )

  ;; Buscar consorcio
  (setq consEncontrado nil)

  (dotimes (i 2)
    (let ((cons (aref vConsorcio i)))
      (when (and cons
                 (numberp (consorcioAbogados-nit cons))
                 (= nitBusqueda (consorcioAbogados-nit cons)))
        (return-from buscarConsorcio
          (progn
            (print "Consorcio encontrado:")
            (format t "Nombre: ~a~%" (consorcioAbogados-nombre cons))
            (format t "NIT: ~a~%" (consorcioAbogados-nit cons))
            (format t "Modalidad: ~a~%" (consorcioAbogados-modalidad cons))
			(format t "Informacion de los abogados:~%")

			(let ((abogados (consorcioAbogados-abogados cons)))
				(dotimes (j (length abogados))
					(let ((abg (aref abogados j)))
						(when abg
							(format t "Abogado ~a:~%" (1+ j))
							(format t "  Nombre: ~a~%" (abogado-nombre abg))
							(format t "  Tarjeta: ~a~%" (abogado-tarjeta abg))
							(format t "  Tipo ~a~%" (abogado-tipo abg))
						)	
					)
				)			
			)
            cons   ; Se devuelve el consorcio encontrado
          )
		)
      )
    )
  )

  ;; Si no se encuentra
  (print "El consorcio no existe")
  nil
)