from typing import Any
from scipy.stats import linregress

def postprocess(results: dict[str, list], conditions: dict[str, Any]) -> dict[str, list]:

    # Gain error calculation:

    # conditions['b'] ... input to the DAC
    # results['vout'] ... simulation results for b
    # slope ... slope of the linear regression of vout
    # FSR = (Vhigh - Vlow) ... (full-scale range)
    # gain_error = (slope * 2^n / FSR) - 1
    
    Vhigh = float(conditions['Vhigh'])
    Vlow = float(conditions['Vlow'])
    
    fsr = (Vhigh - Vlow)

    # Get the step size at which b was incremented
    step = 256 // len(results['vout'])

    # Calculate the best fitting slope
    result = linregress(conditions['b'], results['vout'])

    # Calculate the gain error
    # CACE expects SI units
    gain_error = (result.slope * 255 / fsr) - 1

    return {'gain_error': [gain_error]}
