(defun is-prime (n)
  (cond ((<= n 1) nil)
        ((= n 2) t)
        ((evenp n) nil)
        (t (loop for i from 3 to (isqrt n) by 2
                 never (zerop (mod n i))))))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let ((numbers (read-numbers)))
  (dolist (num numbers)
    (if (is-prime num)
        (format t "~A は素数です。~%" num)
        (format t "~A は素数ではありません。~%" num))))
