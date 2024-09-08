(defun shakutori (arr k)
  (let ((n (length arr))
        (res 0)
        (right 0)
        (sum 0))
    (loop for left from 0 below n do
      (loop while (and (< right n) (<= (+ sum (nth right arr)) k)) do
        (setf sum (+ sum (nth right arr)))
        (incf right))
      (setf res (+ res (- right left)))
      (if (= right left)
          (incf right)
          (setf sum (- sum (nth left arr)))))
    res))

;; 使用例:
(defun read-integer-list ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(format t "配列を入力してください (スペース区切り): ")
(defvar input-array (read-integer-list))
(format t "kの値を入力してください: ")
(defvar k (parse-integer (read-line)))

(defvar result (shakutori input-array k))
(format t "和が ~A 以下の部分配列の数: ~A~%" k result)
