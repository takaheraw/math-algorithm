(defun prime-factors (n)
  (let ((factors '())
        (divisor 2))
    (loop while (> n 1) do
      (loop while (zerop (mod n divisor)) do
        (push divisor factors)
        (setf n (/ n divisor)))
      (incf divisor))
    (reverse factors)))

(format t "整数を入力してください: ")
(let* ((input (read-line))
       (n (parse-integer input)))
  (format t "素因数分解結果: ~A~%" (prime-factors n)))
