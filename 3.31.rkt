(load "wire.rkt")
(load "circuit.rkt")
(load "agenda.rkt")
(load "queue.rkt")

;; a probe
(define (probe name wire)
  (add-action! wire
               (lambda ()
                 (display name)
                 (display " ")
                 (display (current-time the-agenda))
                 (display "  New-value = ")
                 (display (get-signal wire))
                 (newline))))

;; probe the wires
(define the-agenda (make-agenda))
(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)

(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

(probe 'sum sum)			
(probe 'carry carry)			
(half-adder input-1 input-2 sum carry)	
(set-signal! input-1 1)			
(propagate)				
(set-signal! input-2 1)	
(propagate)