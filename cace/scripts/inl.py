
def postprocess(results, conditions):

    print(f'results: {results}')
    print(f'conditions: {conditions}')
    
    # INL calculation:
    # x is the digital value b7:0 converted to an integer
    # V(x) is the original value in RESULT:  The voltage output of the DAC
    #	under the given set of conditions.
    # ALSB = (Vhigh - Vlow) / 256	(ideal voltage step size per LSB)
    #
    # INL(x) = (RESULT - (x * ALSB + Vlow)) / ALSB	(in units of LSB)
    #
    # NOTE that this DAC is based on 256 steps with the highest step being
    # 1 lsb below Vhigh.
    
    Vhigh = float(conditions['Vhigh'])
    Vlow = float(conditions['Vlow'])
    x = float(conditions['b'])
    
    alsb = (Vhigh - Vlow) / 256
    
    inl = []
    
    for vout in results['vout']:
        inl.append((vout - (x * alsb + Vlow)) / alsb)

    output = {'inl': inl}
    
    return output
