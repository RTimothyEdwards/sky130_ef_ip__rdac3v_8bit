
def postprocess(results, conditions):

    print(f'results: {results}')
    print(f'conditions: {conditions}')
    
    # DNL calculation:
    # x is the digital value b7:0 converted to an integer
    # V(x) is the original value in RESULT:  The voltage output of the DAC
    #	under the given set of conditions.
    # ALSB = (VREFH - VREFL) / 256	(ideal voltage step size per LSB)
    #
    # DNL(x) = ((RESULT(x) - RESULT(x-1)) / ALSB) - 1	(in units of LSB)
    
    Vhigh = float(conditions['Vhigh'])
    Vlow = float(conditions['Vlow'])
    x = float(conditions['b'])
    
    alsb = (Vhigh - Vlow) / 256
    
    dnl = []
    
    for vout in results['vout']:
        dnl.append((vout - (x * alsb + Vlow)) / alsb)

    output = {'dnl': dnl}
    
    return output
