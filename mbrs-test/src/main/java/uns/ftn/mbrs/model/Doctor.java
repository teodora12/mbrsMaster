package uns.ftn.mbrs.model;

import javax.persistence.*;
import java.util.*;

import uns.ftn.mbrs.model.Patient;
import uns.ftn.mbrs.model.Examination;
import uns.ftn.mbrs.model.Diagnosis;

@Entity
@Table
public class Doctor {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @Column
    private String surname;

    @Column
    private String jmbg;

    @Column
    private String phoneNumber;

    @Column
    private String name;

    @Column
    private String specialty;


    @OneToMany
    private Set<Patient> patient;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "doctor")
    private Set<Examination> examination;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "doctor")
    private Set<Diagnosis> diagnosis;

    public Long getId(){
         return id;
    }
    public void setId(Long id){
         this.id = id;
    }

    public String getSurname(){
    return surname;
    }

    public void setSurname(String surname){
         this.surname = surname;
    }

    public String getJmbg(){
    return jmbg;
    }

    public void setJmbg(String jmbg){
         this.jmbg = jmbg;
    }

    public String getPhoneNumber(){
    return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber){
         this.phoneNumber = phoneNumber;
    }

    public String getName(){
    return name;
    }

    public void setName(String name){
         this.name = name;
    }

    public String getSpecialty(){
    return specialty;
    }

    public void setSpecialty(String specialty){
         this.specialty = specialty;
    }



    public Set<Patient> getPatient(){
        return patient;
    }
    public void setPatient(Set<Patient> patient){
        this.patient = patient;
    }

    public Set<Examination> getExamination(){
        return examination;
    }
    public void setExamination(Set<Examination> examination){
        this.examination = examination;
    }

    public Set<Diagnosis> getDiagnosis(){
        return diagnosis;
    }
    public void setDiagnosis(Set<Diagnosis> diagnosis){
        this.diagnosis = diagnosis;
    }

}
