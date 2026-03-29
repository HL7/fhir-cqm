/*
@description: This library contains parameter estimate values for the parameters to the model used
to calculate predicted number of events for the Catheter-Associated Urinary Tract Infection Standardized
Infection Ratio, as described in:

1. [NHSN SIR Guide](https://www.cdc.gov/nhsn/2022rebaseline/sir-guide.pdf)
2. As HTML: https://www.cdc.gov/nhsn/2022rebaseline/sir-risk-factors.html
3. CAUTI ACH Factors https://www.cdc.gov/nhsn/2022rebaseline/tables/table-6.html
4. CAUTI CAH Factors https://www.cdc.gov/nhsn/2022rebaseline/tables/table-10.html
*/
library CAUTIParameters

using FHIR version '4.0.1'

include hl7.fhir.uv.cql.FHIRHelpers version '4.0.1'

/*
@description: CAUTI Risk Adjustment factors for Critical Access Hospitals
@comment: Source: https://www.cdc.gov/nhsn/2022rebaseline/tables/table-10.html
*/
define "Critical Access Hospital Parameters":
  List<Tuple {
    parameter String,
    parameterEstimate Decimal,
    standardError Decimal,
    pValue String
  }> {
    // Intercept
    Tuple {
      parameter: 'Intercept',
      parameterEstimate: -7.6495,
      standardError: 0.1492,
      pValue: '<0.0001'
    },

    // Average length of stay >= 6.5 days
    Tuple {
      parameter: 'Average length of stay >= 6.5',
      parameterEstimate: 0.4257,
      standardError: 0.1564,
      pValue: '0.0065'
    },

    // Average length of stay < 6.5 days
    Tuple {
      parameter: 'Average length of stay < 6.5 days',
      parameterEstimate: 0.0,
      standardError: 0.0,
      pValue: 'REFERENT'
    },

    // Proportion of total beds that are ICU < 0.16
    Tuple {
      parameter: 'Proportion of total beds that are ICU < 0.16',
      parameterEstimate: 0.4189,
      standardError: 0.1708,
      pValue: '0.0142'
    },

    // Proportion of total beds that are ICU >= 0.16
    Tuple {
      parameter: 'Proportion of total beds that are ICU >= 0.16',
      parameterEstimate: 0.0,
      standardError: 0.0,
      pValue: 'REFERENT'
    }
  }

/*
@description: CAUTI Risk Adjustment factors for Acute Care Hospitals
@comment: Source: https://www.cdc.gov/nhsn/2022rebaseline/tables/table-6.html
*/
define "Acute Care Hospital Parameters":
List<Tuple {
  parameter String,
  parameterEstimate Decimal,
  standardError Decimal,
  pValue String
}> {
  // Intercept
  Tuple { 
    parameter: 'Intercept', 
    parameterEstimate: -10.2778, 
    standardError: 0.1497, 
    pValue: '<0.0001' 
  },
  
  // Critical Care Group 1
  Tuple { 
    parameter: 'CDC Location Code: Critical Care Group 1 (Burn Critical Care, Pediatric Medical Critical Care, Pediatric Surgical Critical Care)', 
    parameterEstimate: 3.3086, 
    standardError: 0.1786, 
    pValue: '<0.0001' 
  },
  
  // Critical Care Group 2
  Tuple { 
    parameter: 'CDC Location Code: Critical Care Group 2 (Neurosurgical Critical Care, Oncology Pediatric Critical Care, Pediatric Burn Critical Care, Pediatric Medical-Surgical Critical Care, Pediatric Trauma Critical Care)', 
    parameterEstimate: 2.9823, 
    standardError: 0.1493, 
    pValue: '<0.0001' 
  },
  
  // Critical Care Group 3
  Tuple { 
    parameter: 'CDC Location Code: Critical Care Group 3 (Neurologic Critical Care, Pediatric Surgical Cardiothoracic Critical Care, Trauma Critical Care)', 
    parameterEstimate: 2.8105, 
    standardError: 0.1513, 
    pValue: '<0.0001' 
  },
  
  // Critical Care Group 4
  Tuple { 
    parameter: 'CDC Location Code: Critical Care Group 4 (Medical Cardiac Critical Care, Medical Critical Care, Medical-Surgical Critical Care, Oncology Medical Critical Care, Oncology Medical-Surgical Critical Care, Oncology Surgical Critical Care, Onsite Overflow Critical Care, Prenatal Critical Care, Respiratory Critical Care, Surgical Critical Care)', 
    parameterEstimate: 2.4744, 
    standardError: 0.1424, 
    pValue: '<0.0001' 
  },
  
  // Surgical Cardiothoracic Critical Care
  Tuple { 
    parameter: 'CDC Location Code: Surgical Cardiothoracic Critical Care', 
    parameterEstimate: 2.1594, 
    standardError: 0.1509, 
    pValue: '<0.0001' 
  },
  
  // Step Down Group
  Tuple { 
    parameter: 'CDC Location Code: Step Down Group (Adult Step-Down Unit, Oncology Step-Down Unit, Pediatric Step-Down Unit, Step down Neonatal Nursery Level II)', 
    parameterEstimate: 2.6617, 
    standardError: 0.1441, 
    pValue: '<0.0001' 
  },
  
  // Ward Group 1
  Tuple { 
    parameter: 'CDC Location Code: Ward Group 1 (Burn Ward, Neurology Ward, Neurosurgical Ward, Oncology HSCT Ward, Oncology Pediatric Wards, Onsite Overflow Ward, Orthopedic Trauma Ward, Pediatric Medical Ward, Rehabilitation Ward, Stroke Acute Ward)', 
    parameterEstimate: 3.0615, 
    standardError: 0.1479, 
    pValue: '<0.0001' 
  },
  
  // Ward Group 2
  Tuple { 
    parameter: 'CDC Location Code: Ward Group 2 (Dialysis Specialty Care Area, Gerontology Ward, Jail Unit, General Hematology-Oncology Ward, Oncology Mixed Acuity Unit, Pulmonary Ward)', 
    parameterEstimate: 2.7991, 
    standardError: 0.1490, 
    pValue: '<0.0001' 
  },
  
  // Ward Group 3
  Tuple { 
    parameter: 'CDC Location Code: Ward Group 3 (Adult Mixed Acuity Unit, Medical Ward, Oncology Solid Tumor Ward)', 
    parameterEstimate: 2.6868, 
    standardError: 0.1429, 
    pValue: '<0.0001' 
  },
  
  // Ward Group 4
  Tuple { 
    parameter: 'CDC Location Code: Ward Group 4 (Gastrointestinal Ward, Pediatric Mixed Acuity Unit, Telemetry Ward, Vascular Surgery Ward)', 
    parameterEstimate: 2.6006, 
    standardError: 0.1455, 
    pValue: '<0.0001' 
  },
  
  // Ward Group 5
  Tuple { 
    parameter: 'CDC Location Code: Ward Group 5 (Adolescent Behavioral Health Ward, Behavioral Health/Psych Ward, ENT Ward, Medical-Surgical Ward, Mixed Age Mixed Acuity Unit, Pediatric Behavioral Health Ward, Pediatric Burn Ward, Pediatric GU Ward, Pediatric Medical-Surgical Ward, Pediatric Neurology Ward, Pediatric Neurosurgical Ward, Pediatric Orthopedic Ward, Pediatric Rehabilitation Ward, Pediatric SOTP SCA, Plastic Surgery Ward, Orthopedic Ward, SOTP SCA, Surgical Ward, Well Baby Nursery Level I)', 
    parameterEstimate: 2.4987, 
    standardError: 0.1423, 
    pValue: '<0.0001' 
  },
  
  // Ward Group 6
  Tuple { 
    parameter: 'CDC Location Code: Ward Group 6 (Genitourinary Ward, Gynecology Ward, Pediatric Surgical Ward)', 
    parameterEstimate: 2.0046, 
    standardError: 0.2049, 
    pValue: '<0.0001' 
  },
  
  // Ward Group 7 (REFERENT)
  Tuple { 
    parameter: 'CDC Location Code: Ward Group 7 (Antenatal Care Ward, Labor and Delivery Ward, Labor-Delivery-Recovery-Postpartum Suite, Postpartum Ward)', 
    parameterEstimate: 0.0, 
    standardError: 0.0, 
    pValue: 'REFERENT' 
  },
  
  // Total beds: 68-176
  Tuple { 
    parameter: 'Total number of beds: 68-176 beds', 
    parameterEstimate: 0.2577, 
    standardError: 0.0528, 
    pValue: '<0.0001' 
  },
  
  // Total beds: 177-420
  Tuple { 
    parameter: 'Total number of beds: 177-420 beds', 
    parameterEstimate: 0.3347, 
    standardError: 0.0506, 
    pValue: '<0.0001' 
  },
  
  // Total beds: >=421
  Tuple { 
    parameter: 'Total number of beds: ≥421 beds', 
    parameterEstimate: 0.4996, 
    standardError: 0.0522, 
    pValue: '<0.0001' 
  },
  
  // Total beds: 1-67 (REFERENT)
  Tuple { 
    parameter: 'Total number of beds: 1-67 beds', 
    parameterEstimate: 0.0, 
    standardError: 0.0, 
    pValue: 'REFERENT' 
  },
  
  // Medical school affiliation: Major
  Tuple { 
    parameter: 'Medical school affiliation: Major', 
    parameterEstimate: 0.2244, 
    standardError: 0.0204, 
    pValue: '<0.0001' 
  },
  
  // Medical school affiliation: No affiliation (REFERENT)
  Tuple { 
    parameter: 'Medical school affiliation: No affiliation, Undergraduate, Graduate', 
    parameterEstimate: 0.0, 
    standardError: 0.0, 
    pValue: 'REFERENT' 
  },
  
  // Average LOS: 5.7-6.5 days
  Tuple { 
    parameter: 'Average length of stay: 5.7-6.5 days', 
    parameterEstimate: 0.0581, 
    standardError: 0.0235, 
    pValue: '0.0135' 
  },
  
  // Average LOS: >=6.6 days
  Tuple { 
    parameter: 'Average length of stay: ≥6.6 days', 
    parameterEstimate: 0.1833, 
    standardError: 0.0239, 
    pValue: '<0.0001' 
  },
  
  // Average LOS: 1.0-5.6 days (REFERENT)
  Tuple { 
    parameter: 'Average length of stay: 1.0-5.6 days', 
    parameterEstimate: 0.0, 
    standardError: 0.0, 
    pValue: 'REFERENT' 
  },
  
  // Proportion ICU beds: >=0.141
  Tuple { 
    parameter: 'Proportion of total beds that are ICU: ≥0.141', 
    parameterEstimate: 0.0677, 
    standardError: 0.0189, 
    pValue: '0.0003' 
  },
  
  // Proportion ICU beds: <0.141 (REFERENT)
  Tuple { 
    parameter: 'Proportion of total beds that are ICU: <0.141', 
    parameterEstimate: 0.0, 
    standardError: 0.0, 
    pValue: 'REFERENT' 
  }
}

// These would need to access computed data for these characteristics for the location
define fluent function averageLengthOfStayParameter(location Location):
  'Average length of stay >= 6.5 days'

define fluent function proportionOfBedsICUParameter(location Location):
  'Proportion of total beds that are ICU < 0.16'
  
/*
@description: Returns the characteristic codes for the given facility
*/
define function "Location Parameters"(location Location):
  {
    'Intercept',
    location.averageLengthOfStayParameter(),
    location.proportionOfBedsICUParameter()
  }

