(defun gcd (a b)
  (if (zerop b)
      a
      (gcd b (mod a b))))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let ((numbers (read-numbers)))
  (format t "~A~%" (apply #'gcd numbers)))
