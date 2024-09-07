(defun sieve-of-eratosthenes (max)
  (let ((numbers (loop for i from 2 to max collect i))
        (primes '()))
    (loop while numbers do
      (let ((prime (car numbers)))
        (push prime primes)
        (setf numbers (remove-if (lambda (num) (zerop (mod num prime))) (cdr numbers)))))
    (nreverse primes)))

;; 使用例:
(defvar max-number 30)
(defvar primes (sieve-of-eratosthenes max-number))
(format t "~A までの素数: ~{~A~^, ~}" max-number primes)
