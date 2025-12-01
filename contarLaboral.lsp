; ------------------------------------------------------------
; Contar abogados de tipo LABORAL en un consorcio específico
; ------------------------------------------------------------

(defun contarLaboral ()
  (print "------------------------------------------------------")
  (print "CONTAR ABOGADOS LABORAL")
  (print "------------------------------------------------------")

  ;; Leer NIT
  (setq nitBusqueda nil)
  (loop
    (print "Digite el NIT del consorcio:")
    (setq nitBusqueda (read))
    (if (numberp nitBusqueda)
        (return nitBusqueda)
        (print "El NIT debe ser numerico.")
    )
  )

  ;; Buscar consorcio
  (setq consEncontrado nil)
  (dotimes (i 2)
    (let ((cons (aref vConsorcio i)))
      (when (and cons
                 (consorcioAbogados-nit cons)
                 (= nitBusqueda (consorcioAbogados-nit cons)))
        (setq consEncontrado cons)
        (return)
      )
    )
  )

  (when (null consEncontrado)
    (print "No existe un consorcio con ese NIT.")
    (return-from contarLaboral nil)
  )

  ;; Contar abogados de tipo LABORAL
  (setq contador 0)
  (let ((abogados (consorcioAbogados-abogados consEncontrado)))
    (dotimes (j (length abogados))
      (let ((abg (aref abogados j)))
        (when (and abg
                   (equal (abogado-tipo abg) "LABORAL"))
          (setq contador (+ contador 1))
        )
      )
    )
  )

  (print "------------------------------------------------------")
  (format t "El consorcio '~a' tiene ~a abogado(s) de tipo LABORAL.~%"
          (consorcioAbogados-nombre consEncontrado)
          contador)
  (print "------------------------------------------------------")
)
