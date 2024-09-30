from typing import Any

def postprocess(results: dict[str, list], conditions: dict[str, Any]) -> dict[str, list]:

    # Offset error calculation:
    # x is the digital value b7:0 converted to an integer
    # V(x) is the original value in RESULT:  The voltage output of the DAC
    #	under the given set of conditions.
    # FSR = (Vhigh - Vlow) 	(full-scale range)
    # ALSB = (Vhigh - Vlow) / 256	(ideal voltage step size per LSB)
    # Videal(x) = Vlow + x * ALSB
    #
    # offset(x) = 100 * ((V(x) - Videal(x)) / FSR)	 (in units of % FSR)
    
    Vhigh = float(conditions['Vhigh'])
    Vlow = float(conditions['Vlow'])
    x = float(conditions['b'])
    
    fsr = (Vhigh - Vlow)
    alsb = (Vhigh - Vlow) / 256
    videal = Vlow + x * alsb
    
    offset_error = []
    
    # Iterate over MC results
    for vout in results['vout']:
        
        # Calculate the offset error
        # Don't multiply with 100 since
        # CACE expects SI units
        offset_error.append((vout - videal) / fsr)

    return {'offset_error': offset_error}
