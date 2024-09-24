
def postprocess(results, conditions):

    print(f'results: {results}')
    print(f'conditions: {conditions}')
    
    # Gain error calculation:
    # x is the digital value b7:0 converted to an integer
    # V(x) is the original value in RESULT:  The voltage output of the DAC
    #	under the given set of conditions.
    # FSR = (Vhigh - Vlow) 	(full-scale range)
    # ALSB = (Vhigh - Vlow) / 256	(ideal voltage step size per LSB)
    # Videal(x) = Vlow + x * ALSB
    
    Vhigh = float(conditions['Vhigh'])
    Vlow = float(conditions['Vlow'])
    x = float(conditions['b'])
    
    fsr = (Vhigh - Vlow)
    alsb = (Vhigh - Vlow) / 256
    videal = Vlow + x * alsb
    
    gain_error = []
    
    for vout in results['vout']:
    
        print(f'vout: {vout} videal: {videal}')
        print(f'{fsr)}')
        print(f'{((vout - videal) / fsr)}')
        print(f'{100 * ((vout - videal) / fsr)}')
    
        gain_error.append(TODO)

    output = {'gain_error': gain_error}
    
    return output
