
def postprocess(results, conditions):

    print(f'results: {results}')
    print(f'conditions: {conditions}')
    
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
    
    for vout in results['vout']:
        print(f'vout: {vout} videal: {videal}')
        print(f'{fsr}')
        print(f'{((vout - videal) / fsr)}')
        print(f'{100 * ((vout - videal) / fsr)}')
        offset_error.append(100 * ((vout - videal) / fsr))

    output = {'offset_error': offset_error}
    
    return output
