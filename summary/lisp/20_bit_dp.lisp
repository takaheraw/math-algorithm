(defun bit-dp (weights values capacity)
  (let* ((n (length weights))
         (dp (make-array (ash 1 n) :initial-element 0)))
    (loop for s from 1 below (ash 1 n) do
      (loop for i from 0 below n do
        (when (/= 0 (logand s (ash 1 i)))
          (let ((prev-subset (logxor s (ash 1 i))))
            (when (<= (nth i weights) capacity)
              (setf (aref dp s)
                    (max (aref dp s)
                         (+ (aref dp prev-subset) (nth i values)))))))))
    (aref dp (1- (ash 1 n)))))

(defun read-integer-list ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(format t "重さのリストを入力してください (スペース区切り): ")
(defvar weights (read-integer-list))
(format t "価値のリストを入力してください (スペース区切り): ")
(defvar values (read-integer-list))
(format t "ナップサックの容量を入力してください: ")
(defvar capacity (parse-integer (read-line)))

(defvar max-value (bit-dp weights values capacity))
(format t "ビットDPを使用した最大の価値: ~A~%" max-value)
