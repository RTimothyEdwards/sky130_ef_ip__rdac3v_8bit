from typing import Any

def postprocess(results: dict[str, list], conditions: dict[str, Any]) -> dict[str, list]:

    # DNL calculation:
    # x is the digital value b7:0 converted to an integer
    # V(x) is the original value in RESULT:  The voltage output of the DAC
    #	under the given set of conditions.
    # ALSB = (VREFH - VREFL) / 256	(ideal voltage step size per LSB)
    #
    # DNL(x) = ((RESULT(x) - RESULT(x-1)) / ALSB) - 1	(in units of LSB)
    
    Vhigh = float(conditions['Vhigh'])
    Vlow = float(conditions['Vlow'])
    
    alsb = (Vhigh - Vlow) / 256
    
    dnl = []
    b_lower = []
    b_prev = None
    vout_prev = None
    
    for b, vout in zip(conditions['b'], results['vout']):
        # Check for step
        if b_prev != None and b - b_prev == 1:
            # Calculate DNL
            stepdiff = vout - vout_prev
            dnl.append((stepdiff / alsb) - 1)
    
            # Store the lower b of the step
            b_lower.append(b_prev)
    
        b_prev = b
        vout_prev = vout

    return {'dnl': dnl, 'b_lower': b_lower}
