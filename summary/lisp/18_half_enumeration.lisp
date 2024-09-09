(defun half-enumeration (arr target-sum)
  (let* ((n (length arr))
         (half (floor n 2))
         (first-half-subsets (make-hash-table :test #'equal))
         (second-half-subsets (make-hash-table :test #'equal)))
    
    ;; First half subsets
    (dotimes (i (ash 1 half))
      (let ((sum 0))
        (dotimes (j half)
          (when (/= 0 (logand i (ash 1 j)))
            (incf sum (nth j arr))))
        (setf (gethash sum first-half-subsets)
              (1+ (gethash sum first-half-subsets 0)))))
    
    ;; Second half subsets
    (dotimes (i (ash 1 (- n half)))
      (let ((sum 0))
        (dotimes (j (- n half))
          (when (/= 0 (logand i (ash 1 j)))
            (incf sum (nth (+ half j) arr))))
        (setf (gethash sum second-half-subsets)
              (1+ (gethash sum second-half-subsets 0)))))
    
    ;; Count combinations
    (let ((count 0))
      (maphash (lambda (sum1 count1)
                 (let ((needed (- target-sum sum1)))
                   (incf count (* count1 (gethash needed second-half-subsets 0)))))
               first-half-subsets)
      count)))

;; Example usage:
(defun read-integer-list ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(format t "配列を入力してください (スペース区切り): ")
(defvar input-array (read-integer-list))
(format t "目標の和を入力してください: ")
(defvar target-sum (parse-integer (read-line)))

(defvar result (half-enumeration input-array target-sum))
(format t "和が ~A となる部分集合の数: ~A~%" target-sum result)
